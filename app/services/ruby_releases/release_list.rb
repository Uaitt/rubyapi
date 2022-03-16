# frozen_string_literal: true

require "csv"

module RubyReleases
  class ReleaseList
    RELEASE_INDEX_URL = "https://cache.ruby-lang.org/pub/ruby/index.txt"
    RUBY_DEV_ZIP_URL = "https://codeload.github.com/ruby/ruby/zip/master"
    SUPPORTED_RELEASE_FORMAT = "zip"

    def self.fetch
      new.releases
    end

    attr_accessor :releases
    def initialize
      @releases = parse_index(release_index).push(dev)
    end

    private

    def parse_index(index)
      releases = []

      CSV.parse(index, col_sep: "\t", headers: true).map do |l|
        version = if l["name"].start_with?("ruby-")
          l["name"].match(/ruby-(.+)/)[1]
        else
          l["name"]
        end

        releases << RubyVersion.new(version, sha512: l["sha512"], source_url: l["url"]) if supported_release_format?(l["url"])
      rescue ArgumentError
      end

      releases
    end

    def dev
      RubyVersion.new("dev", sha512: "", source_url: RUBY_DEV_ZIP_URL)
    end

    def supported_release_format?(url)
      url.end_with?(SUPPORTED_RELEASE_FORMAT)
    end

    def release_index
      HTTP.get(RELEASE_INDEX_URL).body.to_s
    rescue HTTP::Error
      raise "Unable to download the Ruby release index @ #{RELEASE_INDEX_URL}"
    end
  end
end
