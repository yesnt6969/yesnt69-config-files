-- NEOVIM TEMEL AYARLARI 
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Transparent ayarı
vim.g.transparent_enabled = true 

-- Dosya ağacını hızlıca açıp kapatmak için kısayol (Space + e)
vim.g.mapleader = " " -- Lider tuş ataması
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Görünüm ve Satır Numaraları
vim.opt.number = true          -- Sol tarafta satır numaralarını göster
vim.opt.relativenumber = true  -- Göreceli numaralandırma
vim.opt.termguicolors = true   -- Alacritty'nin zengin renk paletini kullanma

-- 2. Sekme (Tab) ve Boşluk Ayarları
vim.opt.tabstop = 4            -- Bir tab = 4 boşluk genişliğinde
vim.opt.shiftwidth = 4         -- Otomatik girintilemede 4 boşluk kaydır
vim.opt.expandtab = true       -- Tab tuşuna basınca gerçek boşluk karakteri at

-- 3. Kullanım Kolaylıkları
vim.opt.mouse = 'a'            -- Sanal makinede istersen fareyle tıklayıp imleci taşıyabilmek için
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true      -- Arama yaparken büyük/küçük harf duyarlılığını esnet
vim.opt.smartcase = true       -- Büyük harf yazımında aramayı hassaslaştır

-- 4. Renk Şeması
vim.cmd('colorscheme habamax')


-- 5. LAZY.NVIM BOOTSTRAP 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- En kararlı sürümü kullan
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 6. EKLENTİ LİSTESİ VE BAŞLATMA
require("lazy").setup({
    { "xiyaowong/transparent.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30, -- Panel genişliği
                    side = "left", -- Sol tarafta açılsın
                },
            })
        end
    },
})
