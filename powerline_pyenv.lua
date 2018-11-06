local exports = require('path')

function get_virtual_env(env_var)
    env_path = clink.get_env(env_var)
    if env_path then
        basen = exports.basename(env_path)
        return { hasEnv = true, envName = basen }
    end
    return { hasEnv = false, envName = "" }
end

---
 -- add python virutual env name 
---
function condaPrompt()
    -- add in python virtual env name
    local python_env = get_virtual_env('DEFAULT_ENV')
    setPlcPromptLambSymbol(python_env.hasEnv, "["..python_env.envName.."] λ")
end

---
 -- add virtual env name 
---
function venvPrompt()
    -- add in virtual env name
    local venv = get_virtual_env('VIRTUAL_ENV')
    setPlcPromptLambSymbol(venv.hasEnv, "["..venv.envName.."] λ")
end

clink.prompt.register_filter(condaPrompt, 60)
clink.prompt.register_filter(venvPrompt, 60)
