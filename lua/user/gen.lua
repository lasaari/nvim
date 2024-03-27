-- local status_ok, gen = pcall(require, "gen")
-- if not status_ok then
--   return
-- end
--
-- gen.setup ({
--         model = "codellama:13b", -- The default model to use.
--         host = "10.0.0.13", -- The host running the Ollama service.
--         port = "11434", -- The port on which the Ollama service is listening.
--         display_mode = "float", -- The display mode. Can be "float" or "split".
--         show_prompt = false, -- Shows the Prompt submitted to Ollama.
--         show_model = false, -- Displays which model you are using at the beginning of your chat session.
--         quit_map = "q", -- set keymap for quit
--         no_auto_close = false, -- Never closes the window automatically.
--         -- Function to initialize Ollama
--         command = function(options)
--             return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
--         end,
-- })


local status_ok, gpt = pcall(require, "chatgpt")
if not status_ok then
  return
end

gpt.setup ({
        api_host_cmd = "echo http://10.0.0.180:11434",
        api_key_cmd = "echo ''",
        openai_params = {
          model = "codellama:13b",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 300,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "codellama:13b",
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          top_p = 1,
          n = 1,
        },    
})


