# frozen_string_literal: true

#
# Muffin - Multi-Language Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

module SnippetHelper
  # Create a runner instance
  def self.get_runner(language, local_path, version, slug, code)
    if language == :python
      PythonRunner.new(local_path, version, slug, code)
    elsif language == :ruby
      RubyRunner.new(local_path, version, slug, code)
    elsif language == :php
      PHPRunner.new(local_path, version, slug, code)
    elsif language == :golang
      GolangRunner.new(local_path, version, slug, code)
    end
  end

  # Python Runner
  class PythonRunner
    def initialize(local_path, version, slug, code)
      @language = "python"
      @local_path = local_path
      @version = version
      @slug = slug
      @code = code
    end

    # Build isolated environment
    def isolate_environment
      # Make directory
      if !Dir.exists?("#{@local_path}/#{slug}")
        Dir.mkdir("#{@local_path}/#{slug}")
      end

      # Create Dockerfile
      if !File.exists?("#{@local_path}/#{slug}/Dockerfile")
        dockerfile = "FROM #{@language}:#{@version}\n".dup
        dockerfile << "RUN mkdir -p /etc/muffin\n"
        dockerfile << "VOLUME /etc/muffin\n"
        dockerfile << "CMD ['#{@language}']\n"

        File.write("#{@local_path}/#{slug}/Dockerfile", dockerfile)
      end

      # Create code snippet
      if !File.exists?("#{@local_path}/#{@slug}/script.py")
        File.write("#{@local_path}/#{@slug}/script.py", @code)
      end
    end

    # Build docker image
    def build_image
      # Build docker image
      result = AwesomeSpawn.run("docker build . -t #{@language}:#{@version} -f #{@local_path}/#{slug}/Dockerfile")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while building docker image: #{result.error}"
      end

      result.output
    end

    # Run the code using the docker image
    def run_script
      result = AwesomeSpawn.run("docker run --rm -v #{@local_path}/#{slug}:#{@local_path}/#{slug} #{@language}:#{@version} #{@language} #{@local_path}/#{@slug}/script.py")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while running the script: #{result.error}"
      end

      result.output
    end

    attr_reader :local_path
    attr_reader :version
    attr_reader :slug
    attr_reader :code
  end

  # Ruby Runner
  class RubyRunner
    def initialize(local_path, version, slug, code)
      @language = "ruby"
      @local_path = local_path
      @version = version
      @slug = slug
      @code = code
    end

    # Build isolated environment
    def isolate_environment
      # Make directory
      if !Dir.exists?("#{@local_path}/#{slug}")
        Dir.mkdir("#{@local_path}/#{slug}")
      end

      # Create Dockerfile
      if !File.exists?("#{@local_path}/#{slug}/Dockerfile")
        dockerfile = "FROM #{@language}:#{@version}\n".dup
        dockerfile << "RUN mkdir -p /etc/muffin\n"
        dockerfile << "VOLUME /etc/muffin\n"
        dockerfile << "CMD ['#{@language}']\n"

        File.write("#{@local_path}/#{slug}/Dockerfile", dockerfile)
      end

      # Create code snippet
      if !File.exists?("#{@local_path}/#{@slug}/script.rb")
        File.write("#{@local_path}/#{@slug}/script.rb", @code)
      end
    end

    # Build docker image
    def build_image
      # Build docker image
      result = AwesomeSpawn.run("docker build . -t #{@language}:#{@version} -f #{@local_path}/#{slug}/Dockerfile")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while building docker image: #{result.error}"
      end

      result.output
    end

    # Run the code using the docker image
    def run_script
      result = AwesomeSpawn.run("docker run --rm -v #{@local_path}/#{slug}:#{@local_path}/#{slug} #{@language}:#{@version} #{@language} #{@local_path}/#{@slug}/script.rb")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while running the script: #{result.error}"
      end

      result.output
    end

    attr_reader :local_path
    attr_reader :version
    attr_reader :slug
    attr_reader :code
  end

  # PHP Runner
  class PHPRunner
    def initialize(local_path, version, slug, code)
      @language = "php"
      @local_path = local_path
      @version = version
      @slug = slug
      @code = code
    end

    # Build isolated environment
    def isolate_environment
      # Make directory
      if !Dir.exists?("#{@local_path}/#{slug}")
        Dir.mkdir("#{@local_path}/#{slug}")
      end

      # Create Dockerfile
      if !File.exists?("#{@local_path}/#{slug}/Dockerfile")
        dockerfile = "FROM #{@language}:#{@version}\n".dup
        dockerfile << "RUN mkdir -p /etc/muffin\n"
        dockerfile << "VOLUME /etc/muffin\n"
        dockerfile << "CMD ['#{@language}']\n"

        File.write("#{@local_path}/#{slug}/Dockerfile", dockerfile)
      end

      # Create code snippet
      if !File.exists?("#{@local_path}/#{@slug}/script.php")
        File.write("#{@local_path}/#{@slug}/script.php", @code)
      end
    end

    # Build docker image
    def build_image
      # Build docker image
      result = AwesomeSpawn.run("docker build . -t #{@language}:#{@version} -f #{@local_path}/#{slug}/Dockerfile")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while building docker image: #{result.error}"
      end

      result.output
    end

    # Run the code using the docker image
    def run_script
      result = AwesomeSpawn.run("docker run --rm -v #{@local_path}/#{slug}:#{@local_path}/#{slug} #{@language}:#{@version} #{@language} #{@local_path}/#{@slug}/script.php")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while running the script: #{result.error}"
      end

      result.output
    end

    attr_reader :local_path
    attr_reader :version
    attr_reader :slug
    attr_reader :code
  end

  # Golang Runner
  class GolangRunner
    def initialize(local_path, version, slug, code)
      @language = "golang"
      @local_path = local_path
      @version = version
      @slug = slug
      @code = code
    end

    # Build isolated environment
    def isolate_environment
      # Make directory
      if !Dir.exists?("#{@local_path}/#{slug}")
        Dir.mkdir("#{@local_path}/#{slug}")
      end

      # Create Dockerfile
      if !File.exists?("#{@local_path}/#{slug}/Dockerfile")
        dockerfile = "FROM #{@language}:#{@version}\n".dup
        dockerfile << "RUN mkdir -p /etc/muffin\n"
        dockerfile << "VOLUME /etc/muffin\n"
        dockerfile << "CMD ['#{@language}']\n"

        File.write("#{@local_path}/#{slug}/Dockerfile", dockerfile)
      end

      # Create code snippet
      if !File.exists?("#{@local_path}/#{@slug}/script.go")
        File.write("#{@local_path}/#{@slug}/script.go", @code)
      end
    end

    # Build docker image
    def build_image
      # Build docker image
      result = AwesomeSpawn.run("docker build . -t #{@language}:#{@version} -f #{@local_path}/#{slug}/Dockerfile")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while building docker image: #{result.error}"
      end

      result.output
    end

    # Run the code using the docker image
    def run_script
      result = AwesomeSpawn.run("docker run --rm -v #{@local_path}/#{slug}:#{@local_path}/#{slug} #{@language}:#{@version} go run #{@local_path}/#{@slug}/script.go")

      if result.exit_status != 0 || result.error != ""
        raise Exception.new "Error while running the script: #{result.error}"
      end

      result.output
    end

    attr_reader :local_path
    attr_reader :version
    attr_reader :slug
    attr_reader :code
  end
end
