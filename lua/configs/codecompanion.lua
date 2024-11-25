print(os.getenv "GLHF_API_KEY")
require("codecompanion").setup {
  language = "Russian",
  strategies = {
    chat = {
      adapter = "openai_compatible",
    },
    inline = {
      adapter = "openai_compatible",
    },
    agent = {
      adapter = "openai_compatible",
    },
  },
  adapters = {
    openai_compatible = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://glhf.chat",
          api_key = os.getenv "GLHF_API_KEY",
          chat_url = "/api/openai/v1/chat/completions",
        },
        schema = {
          model = {
            -- Or any GLHF model!
            default = "hf:Qwen/Qwen2.5-Coder-32B-Instruct",
          },
          num_ctx = {
            default = 32768,
          },
        },
      })
    end,
  },
}
