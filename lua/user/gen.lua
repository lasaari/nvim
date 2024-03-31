local status_ok, gen = pcall(require, "gen")
if not status_ok then
  return
end

gen.setup ({
        model = "dolphincoder", -- The default model to use.
        host = "10.0.0.180", -- The host running the Ollama service.
        port = "11434", -- The port on which the Ollama service is listening.
        display_mode = "float", -- The display mode. Can be "float" or "split".
        show_prompt = false, -- Shows the Prompt submitted to Ollama.
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        quit_map = "q", -- set keymap for quit
        no_auto_close = false, -- Never closes the window automatically.
        -- Function to initialize Ollama
        command = function(options)
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
})


