return {
    {
        "folke/snacks.nvim",
        force = false,
        opts = {
            picker = {
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                    },
                    files = {
                        hidden = true,
                        ignored = false,
                    },
                },
            },
            styles = {
                snacks_image = {
                    snacks_image = function()
                        return {
                            relative = "cursor",
                            border = "none",
                            focusable = false,
                            backdrop = false,
                            row = 0,
                            col = 0,
                        }
                    end,
                },
            },
            image = {
                formats = {
                    "png",
                    "jpg",
                    "jpeg",
                    "gif",
                    "bmp",
                    "webp",
                    "tiff",
                    "heic",
                    "avif",
                    "mp4",
                    "mov",
                    "avi",
                    "mkv",
                    "webm",
                    "pdf",
                },
            },
            doc = {
                enabled = true,
                inline = false,
                float = true,
                max_width = 60,
                max_height = 30,
            },
            wo = {
                wrap = false,
                number = false,
                relativenumber = false,
                cursorcolumn = false,
                signcolumn = "no",
                foldcolumn = "0",
                statuscolumn = "",
            },

            convert = {
                notify = true,
                magick = {
                    default = { "{src}[0]", "-scale", "1280x720>" },
                    vector = { "-density", 192, "{src}[0]" },
                    math = { "-density", 192, "{src}[0]", "-trim" },
                    pdf = { "-density", 192, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
                },
            },

            icons = {
                math = "󰪚 ",
                chart = "󰄧 ",
                image = " ",
            },

            typst = {
                tpl = [[
        #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
        #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
        #set text(size: 12pt, fill: rgb("${color}"))
        ${header}
        ${content}]],
            },
        },
    },
}
