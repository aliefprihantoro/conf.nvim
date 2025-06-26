---for bin compatible with termux distro
return function()
  local NAME_DISTRO = 'debian'
  local listFolder = vim.fn.glob '/data/data/com.termux/files/home/.codeium/bin/*'
  for _, v in ipairs(vim.fn.split(listFolder, '\n')) do
    local OLD_FILE = v .. '/language_server_linux_arm'
    local NEW_FILE = v .. '/bin'
    local isHaveFile = vim.fn.filereadable(NEW_FILE)
    if isHaveFile ~= 1 then
      vim.fn.rename(OLD_FILE, NEW_FILE)
      vim.fn.system('chmod +x ' .. NEW_FILE)
      vim.fn.system(
        'echo "#!/data/data/com.termux/files/usr/bin/bash\n proot-distro login '
          .. NAME_DISTRO
          .. ' -- '
          .. NEW_FILE
          .. ' \\$@" > '
          .. OLD_FILE
      )
      vim.fn.system('chmod +x ' .. OLD_FILE)
    end
  end
end
