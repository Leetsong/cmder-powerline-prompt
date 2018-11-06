local exports = require('path')

function get_virtual_env(env_var)
    env_path = clink.get_env(env_var)
    if env_path then
        basen = exports.basename(env_path)
        return basen
    end
    return false
end

---
 -- add python virutual env name 
---
function conda_prompt_filter()
    -- add in python virtual env name
    local python_env = get_virtual_env('DEFAULT_ENV')
    if python_env then
        plc_prompt_lambSymbol = "["..python_env.."] λ"
    end
end

---
 -- add virtual env name 
---
function venv_prompt_filter()
    -- add in virtual env name
    local venv = get_virtual_env('VIRTUAL_ENV')
    if venv then
        plc_prompt_lambSymbol = "["..venv.."] λ"
    end
end

clink.prompt.register_filter(conda_prompt_filter, 60)
clink.prompt.register_filter(venv_prompt_filter, 60)
