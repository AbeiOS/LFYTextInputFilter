module Fastlane
  module Actions
    module SharedValues
      REMOVE_TAG_CUSTOM_VALUE = :REMOVE_TAG_CUSTOM_VALUE
    end

    class RemoveTagAction < Action
      def self.run(params)
        tagName = params[:tag]
        isRemoveLocal = params[:rL];
        isRemoveRemote = params[:rR];

        # 1. 先定义一个 action 数组，每次将操作添加到这个数组中。
        cmds = []

        if isRemoveLocal
          cmds << "git tag -d #{tagName} "
        end

        if isRemoveRemote
          cmds << "git push origin :#{tagName}"
        end

        # 2. 数组添加完成后，执行数组内所有命令。
        result = Actions.sh(cmds.join('&'));

        return result

      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "删除 tag 的 Action"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "你可以使用这个 action 达到 git tag -d 等等效果"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                                       optional: false,
                                       description: "你想要删除的 tag 名称（是字符串，例如：'0.1.0'）",
                                       is_string: true, # true: verifies the input is a string, false: every kind of value
                                       default_value: false),

          FastlaneCore::ConfigItem.new(key: :rL,
                                       optional: true,
                                       description: "是否删除本地 tag",
                                       is_string: false, # true: verifies the input is a string, false: every kind of value
                                       default_value: true),

          FastlaneCore::ConfigItem.new(key: :rR,
                                       optional: true,
                                       description: "是否删除远程 tag",
                                       is_string: false, # true: verifies the input is a string, false: every kind of value
                                       default_value: true),
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['REMOVE_TAG_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :ios
        # 
        #  [:ios, :mac].include?(platform)
        # 

        platform == :ios
      end
    end
  end
end
