local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "RetroEditorV2"
gui.ResetOnSpawn = false

-- Colores
local colors = {
    black = Color3.fromRGB(0,0,0),
    darkGray = Color3.fromRGB(31,31,31),
    gray = Color3.fromRGB(51,51,51),
    panel = Color3.fromRGB(26,26,26),
    white = Color3.fromRGB(255,255,255)
}

-- MainFrame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0,900,0,400)
mainFrame.Position = UDim2.new(0,114,0,55)
mainFrame.BackgroundColor3 = colors.black

-- Panel superior
local topPanel = Instance.new("Frame", mainFrame)
topPanel.Size = UDim2.new(0,900,0,50)
topPanel.Position = UDim2.new(0,0,0,0)
topPanel.BackgroundColor3 = colors.darkGray

-- ImageButtons superiores
local images = {
    {id = "rbxassetid://94821103087106", posX = 3},
    {id = "rbxassetid://18367038485", posX = 30},
    {id = "rbxassetid://94821103087106", posX = 90, label = "Workspace"}
}

for _,imgData in ipairs(images) do
    local btn = Instance.new("ImageButton", topPanel)
    btn.BackgroundTransparency = 1
    btn.Size = UDim2.new(0,20,0,20)
    btn.Position = UDim2.new(0,imgData.posX,0,3)
    btn.Image = imgData.id

    if imgData.label then
        local label = Instance.new("TextLabel", topPanel)
        label.Size = UDim2.new(0,60,0,20)
        label.Position = UDim2.new(0,imgData.posX + 25,0,0)
        label.BackgroundTransparency = 1
        label.Text = imgData.label
        label.TextColor3 = colors.white
        label.Font = Enum.Font.Legacy
        label.TextSize = 12
    end
end

-- Botones inferiores
local buttonNames = {"File","Home","Share","View"}
for i,name in ipairs(buttonNames) do
    local btn = Instance.new("TextButton", mainFrame)
    btn.Size = UDim2.new(0,40,0,20)
    btn.Position = UDim2.new(0,3 + (i-1)*50,0,25)
    btn.Text = name
    btn.BackgroundTransparency = 1
    btn.TextColor3 = colors.white
    btn.Font = Enum.Font.Legacy
    btn.TextSize = 8
end

-- Panel inferior de comandos
local commandPanel = Instance.new("Frame", mainFrame)
commandPanel.Size = UDim2.new(0,900,0,40)
commandPanel.Position = UDim2.new(0,0,0,50)
commandPanel.BackgroundColor3 = colors.panel

-- Botones existentes
local commands = {
    {id = "rbxassetid://5173558738", text = "Execute", color = Color3.fromRGB(255,255,255), posX = 8},
    {id = "rbxassetid://106637232943562", text = "Copy", color = Color3.fromRGB(255,255,255), posX = 46},
    {id = "rbxassetid://132756352515853", text = "Paste", color = Color3.fromRGB(255,255,255), posX = 84},
    {id = "rbxassetid://123418072969228", text = "Explorer", color = colors.white, posX = 122}
}

for _,cmd in ipairs(commands) do
    local btn = Instance.new("ImageButton", commandPanel)
    btn.BackgroundTransparency = 1
    btn.Size = UDim2.new(0,25,0,25)
    btn.Position = UDim2.new(0,cmd.posX,0,2)
    btn.Image = cmd.id
    btn.ImageColor3 = cmd.color

    local label = Instance.new("TextLabel", btn)
    label.Size = UDim2.new(0,40,0,10)
    label.Position = UDim2.new(0,-5,0,28)
    label.BackgroundTransparency = 1
    label.Text = cmd.text
    label.Font = Enum.Font.Legacy
    label.TextSize = 8
    label.TextColor3 = colors.white
end

-- Nuevos ImageButtons: Move To y Copy To
local newCommands = {
    {id = "rbxassetid://113824765025030", text = "Move To", posX = 160},
    {id = "rbxassetid://121262325844002", text = "Copy To", posX = 198}
}

for _,cmd in ipairs(newCommands) do
    local btn = Instance.new("ImageButton", commandPanel)
    btn.BackgroundTransparency = 1
    btn.Size = UDim2.new(0,25,0,25)
    btn.Position = UDim2.new(0,cmd.posX,0,2)
    btn.Image = cmd.id
    btn.ImageColor3 = colors.white

    local label = Instance.new("TextLabel", btn)
    label.Size = UDim2.new(0,40,0,10)
    label.Position = UDim2.new(0,-5,0,28)
    label.BackgroundTransparency = 1
    label.Text = cmd.text
    label.Font = Enum.Font.Legacy
    label.TextSize = 8
    label.TextColor3 = colors.white
end

-- Frame separador
local separatorFrame = Instance.new("Frame", commandPanel)
separatorFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
separatorFrame.Size = UDim2.new(0,6,0,40)
separatorFrame.Position = UDim2.new(0,280,0,0)

-- Botón Delete sobre el separador
local deleteBtn = Instance.new("ImageButton", commandPanel)
deleteBtn.BackgroundTransparency = 1
deleteBtn.Size = UDim2.new(0,25,0,25)
deleteBtn.Position = UDim2.new(0,288,0,2)
deleteBtn.Image = "rbxassetid://92626099362846"
deleteBtn.ImageColor3 = colors.white

local labelDelete = Instance.new("TextLabel", deleteBtn)
labelDelete.Size = UDim2.new(0,40,0,10)
labelDelete.Position = UDim2.new(0,-5,0,28)
labelDelete.BackgroundTransparency = 1
labelDelete.Text = "Delete"
labelDelete.Font = Enum.Font.Legacy
labelDelete.TextSize = 8
labelDelete.TextColor3 = colors.white

-- TextButton para crear folders
local folderBtn = Instance.new("TextButton", commandPanel)
folderBtn.Size = UDim2.new(0,60,0,25)
folderBtn.Position = UDim2.new(0,326,0,2)
folderBtn.Text = "New Folder"
folderBtn.BackgroundColor3 = colors.darkGray
folderBtn.TextColor3 = colors.white
folderBtn.Font = Enum.Font.Legacy
folderBtn.TextSize = 10

-- Contenedor editor y líneas
local editorContainer = Instance.new("Frame", mainFrame)
editorContainer.Size = UDim2.new(0,430,0,290)
editorContainer.Position = UDim2.new(0,350,0,100)
editorContainer.BackgroundTransparency = 1

-- Line numbers
local lineNums = Instance.new("TextLabel", editorContainer)
lineNums.Size = UDim2.new(0,30,1,0)
lineNums.Position = UDim2.new(0,0,0,0)
lineNums.BackgroundColor3 = colors.panel
lineNums.TextColor3 = colors.white
lineNums.TextXAlignment = Enum.TextXAlignment.Center -- << cambiado a Center
lineNums.TextYAlignment = Enum.TextYAlignment.Top
lineNums.Font = Enum.Font.Code
lineNums.TextSize = 12
lineNums.ClipsDescendants = true -- << agregado
lineNums.Text = "1"

-- Editor ScrollingFrame
local editorScroll = Instance.new("ScrollingFrame", editorContainer)
editorScroll.Size = UDim2.new(1,-30,1,0)
editorScroll.Position = UDim2.new(0,30,0,0)
editorScroll.BackgroundColor3 = colors.gray
editorScroll.CanvasSize = UDim2.new(0,0,0,0)
editorScroll.ScrollBarThickness = 6

-- TextBox editor
local editorBox = Instance.new("TextBox", editorScroll)
editorBox.Size = UDim2.new(1,0,0,0)
editorBox.Position = UDim2.new(0,0,0,0)
editorBox.BackgroundTransparency = 1
editorBox.ClearTextOnFocus = false
editorBox.MultiLine = true
editorBox.RichText = true
editorBox.TextXAlignment = Enum.TextXAlignment.Left
editorBox.TextYAlignment = Enum.TextYAlignment.Top
editorBox.TextColor3 = colors.white
editorBox.Font = Enum.Font.Code
editorBox.TextSize = 12
editorBox.Text = "-- Escribe tu código aquí..."

-- Actualizar líneas y canvas
local function updateLines()
    local count = 1
    for _ in string.gmatch(editorBox.Text, "\n") do count += 1 end
    local buffer = {}
    for i=1,count do buffer[#buffer+1] = tostring(i) end
    lineNums.Text = table.concat(buffer,"\n")

    task.defer(function()
        editorBox.Size = UDim2.new(1,0,0,editorBox.TextBounds.Y)
        editorScroll.CanvasSize = UDim2.new(0,0,0,math.max(editorBox.TextBounds.Y, editorScroll.AbsoluteSize.Y))
    end)
end
editorBox:GetPropertyChangedSignal("Text"):Connect(updateLines)
updateLines()

-- Explorer ScrollingFrame
local explorerScroll = Instance.new("ScrollingFrame", mainFrame)
explorerScroll.BackgroundColor3 = colors.gray
explorerScroll.Size = UDim2.new(0,300,0,290)
explorerScroll.Position = UDim2.new(0,20,0,100)
explorerScroll.CanvasSize = UDim2.new(0,0,0,0)
explorerScroll.ScrollBarThickness = 6

-- Border helper
local function borderify(frame)
    local stroke = Instance.new("UIStroke")
    stroke.Color = colors.white
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = frame
end

-- Definir servicios (asegúrate de esto antes de construir el explorer)
local services = {
    game:GetService("Workspace"),
    game:GetService("ReplicatedStorage"),
    game:GetService("StarterGui"),
    game:GetService("StarterPlayer"),
    game:GetService("Players"),
    game:GetService("Lighting"),
    game:GetService("ServerScriptService"),
    game:GetService("Teams"),
    game:GetService("Chat"),
    game:GetService("ReplicatedFirst")
}

-- Función recursiva para crear árbol del Explorer
local function createTree(parentGui, parentObj, depth)
    local children = {}

    if not parentObj then return children end

    for _, obj in ipairs(parentObj:GetChildren()) do
        local kind = obj:IsA("Folder") and "Folder"
                   or (obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript")) and "Script"
                   or "Object"

        local prefix = kind == "Folder" and "📁 " or kind == "Script" and "📜 " or "🔹 "
        local item = Instance.new("TextButton")
        item.Size = UDim2.new(1,-6,0,22)
        item.BackgroundColor3 = colors.panel
        item.AutoButtonColor = true
        item.TextXAlignment = Enum.TextXAlignment.Left
        item.Font = Enum.Font.Code
        item.TextSize = 12
        item.TextColor3 = colors.white
        item.Text = string.rep("  ", depth) .. prefix .. obj.Name
        item.Parent = parentGui
        borderify(item)

        local subChildren = {}
        if kind == "Folder" then
            subChildren = createTree(parentGui, obj, depth+1)
            for _,c in ipairs(subChildren) do c.Visible = false end

            item.MouseButton1Click:Connect(function()
                local expanded = not subChildren[1] or not subChildren[1].Visible
                for _,c in ipairs(subChildren) do c.Visible = expanded end
                updateExplorerPositions()
            end)
        elseif kind == "Script" then
            item.MouseButton1Click:Connect(function()
                local success, content = pcall(function() return obj.Source end)
                editorBox.Text = success and content or "-- Failed: "..obj.Name
            end)
        else
            item.MouseButton1Click:Connect(function()
                editorBox.Text = "-- "..obj.Name.." is not a script."
            end)
        end

        table.insert(children, item)
        for _,c in ipairs(subChildren) do table.insert(children, c) end
    end

    return children
end

-- Función para recalcular posiciones Y y CanvasSize
function updateExplorerPositions()
    local currentY = 0
    local function setPosRecursively(parent)
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("TextButton") then
                child.Position = UDim2.new(0,0,0,currentY)
                if child.Visible then
                    currentY += 22
                    setPosRecursively(child)
                end
            end
        end
    end
    setPosRecursively(explorerScroll)
    explorerScroll.CanvasSize = UDim2.new(0,0,currentY,0)
end

-- Construcción del explorer
for _, svc in ipairs(services) do
    local folderItem = Instance.new("TextButton")
    folderItem.Size = UDim2.new(1,-6,0,22)
    folderItem.BackgroundColor3 = colors.panel
    folderItem.AutoButtonColor = true
    folderItem.TextXAlignment = Enum.TextXAlignment.Left
    folderItem.Font = Enum.Font.Code
    folderItem.TextSize = 12
    folderItem.TextColor3 = colors.white
    folderItem.Text = "📁 "..svc.Name
    folderItem.Parent = explorerScroll
    borderify(folderItem)

    local children = createTree(explorerScroll, svc, 1)
    for _,c in ipairs(children) do c.Visible = false end

    folderItem.MouseButton1Click:Connect(function()
        local expanded = not children[1] or not children[1].Visible
        for _,c in ipairs(children) do c.Visible = expanded end
        updateExplorerPositions()
    end)
end

-- Inicializar posiciones
updateExplorerPositions()

-- Hacer draggable la GUI con Active y Draggable
mainFrame.Active = true
mainFrame.Draggable = true

-- Botón minimizar
local minBtn = Instance.new("TextButton", topPanel)
minBtn.Size = UDim2.new(0,30,0,20)
minBtn.Position = UDim2.new(1,-35,0,15)
minBtn.BackgroundColor3 = colors.darkGray
minBtn.TextColor3 = colors.white
minBtn.Font = Enum.Font.Legacy
minBtn.TextSize = 14
minBtn.Text = "_"

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    mainFrame.Size = minimized and UDim2.new(0,200,0,50) or UDim2.new(0,900,0,400)
    -- Opcional: ocultar editor y explorer al minimizar
    editorContainer.Visible = not minimized
    explorerScroll.Visible = not minimized
    commandPanel.Visible = not minimized
end)

-- Limitar líneas para que no se salgan del editor
editorBox:GetPropertyChangedSignal("Text"):Connect(function()
    for line in editorBox.Text:gmatch("[^\n]+") do
        if #line > 120 then
            editorBox.Text = editorBox.Text:gsub(line, line:sub(1,120).."…")
        end
    end
end)

-- Lógica del botón Execute
do
    local executeBtn
    for _, child in ipairs(commandPanel:GetChildren()) do
        if child:IsA("ImageButton") then
            local label = child:FindFirstChildOfClass("TextLabel")
            if label and label.Text == "Execute" then
                executeBtn = child
                break
            end
        end
    end

    if executeBtn then
        executeBtn.MouseButton1Click:Connect(function()
            local code = editorBox.Text
            local success, result = pcall(function()
                return loadstring(code)()
            end)
            if not success then
                warn("Error ejecutando código: "..tostring(result))
            else
                print("Código ejecutado correctamente")
            end
        end)
    end
end

-- Lógica del botón Copy
do
    local copyBtn
    for _, child in ipairs(commandPanel:GetChildren()) do
        if child:IsA("ImageButton") then
            local label = child:FindFirstChildOfClass("TextLabel")
            if label and label.Text == "Copy" then
                copyBtn = child
                break
            end
        end
    end

    if copyBtn then
        copyBtn.MouseButton1Click:Connect(function()
            local success, result = pcall(function()
                return editorBox.Text
            end)
            if success then
                setclipboard(result)
                print("Texto copiado al portapapeles")
            else
                warn("Error copiando texto: "..tostring(result))
            end
        end)
    end
end

-- Lógica del botón Paste (no implementado)
do
    local pasteBtn
    for _, child in ipairs(commandPanel:GetChildren()) do
        if child:IsA("ImageButton") then
            local label = child:FindFirstChildOfClass("TextLabel")
            if label and label.Text == "Paste" then
                pasteBtn = child
                break
            end
        end
    end

    if pasteBtn then
        pasteBtn.MouseButton1Click:Connect(function()
            editorBox.Text = editorBox.Text .. "\n-- Paste not implemented"
            print("Paste action is not implemented yet")
        end)
    end
end

-- Lógica del botón Explorer (Loadstring)
do
    local explorerBtn
    for _, child in ipairs(commandPanel:GetChildren()) do
        if child:IsA("ImageButton") then
            local label = child:FindFirstChildOfClass("TextLabel")
            if label and label.Text == "Explorer" then
                explorerBtn = child
                break
            end
        end
    end

    if explorerBtn then
        explorerBtn.MouseButton1Click:Connect(function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Keyless-mobile-dex-17888"))()

                loadstring(editorBox.Text)()
            end)
            if not success then
                editorBox.Text = editorBox.Text .. "\n-- Failed to execute Explorer Loadstring"
                print("Explorer Loadstring failed:", result)
            end
        end)
    end
end

-- Botón Paste
for _,cmd in ipairs(commands) do
    if cmd.text == "Paste" then
        local btn = commandPanel:FindFirstChild(cmd.text)
        if btn then
            btn.MouseButton1Click:Connect(function()
                local msg = Instance.new("TextLabel", mainFrame)
                msg.Size = UDim2.new(0,300,0,30)
                msg.Position = UDim2.new(0.5,-150,0.8,0)
                msg.BackgroundColor3 = Color3.fromRGB(50,50,50)
                msg.TextColor3 = Color3.fromRGB(255,255,255)
                msg.Text = "Paste feature not implemented"
                msg.Font = Enum.Font.Legacy
                msg.TextSize = 14
                msg.TextScaled = true
                msg.TextWrapped = true
                msg.ClipsDescendants = true

                task.delay(3, function()
                    msg:Destroy()
                end)
            end)
        end
    end
end

-- Botón Explorer (solo para PC)
for _,cmd in ipairs(commands) do
    if cmd.text == "Explorer" then
        local btn = commandPanel:FindFirstChild(cmd.text)
        if btn then
            btn.MouseButton1Click:Connect(function()
                if not UserInputService.KeyboardEnabled then
                    local msg = Instance.new("TextLabel", mainFrame)
                    msg.Size = UDim2.new(0,300,0,30)
                    msg.Position = UDim2.new(0.5,-150,0.8,0)
                    msg.BackgroundColor3 = Color3.fromRGB(50,50,50)
                    msg.TextColor3 = Color3.fromRGB(255,255,255)
                    msg.Text = "Explorer only available on PC"
                    msg.Font = Enum.Font.Legacy
                    msg.TextSize = 14
                    msg.TextScaled = true
                    msg.TextWrapped = true
                    msg.ClipsDescendants = true

                    task.delay(3, function()
                        msg:Destroy()
                    end)
                    return
                end

                -- Aquí podrías colocar tu Loadstring para cargar el explorer
                loadstring("print('Explorer loaded!')")()
            end)
        end
    end
end

-- File Menu
local fileMenu
local fileBtn -- suponiendo que este es el botón "File" que ya creaste

-- Buscar el botón "File"
for _, btn in ipairs(mainFrame:GetChildren()) do
    if btn:IsA("TextButton") and btn.Text == "File" then
        fileBtn = btn
        break
    end
end

if fileBtn then
    fileBtn.MouseButton1Click:Connect(function()
        -- Evitar duplicar el menú
        if fileMenu and fileMenu.Parent then
            fileMenu:Destroy()
        end

        -- Crear frame del menú
        fileMenu = Instance.new("Frame", mainFrame)
        fileMenu.Size = UDim2.new(0,150,0,100)
        fileMenu.Position = UDim2.new(0, fileBtn.Position.X.Offset, 0, fileBtn.Position.Y.Offset + fileBtn.Size.Y.Offset)
        fileMenu.BackgroundColor3 = colors.darkGray
        fileMenu.BorderColor3 = colors.white
        fileMenu.BorderSizePixel = 1

        -- Botón cerrar
        local closeBtn = Instance.new("TextButton", fileMenu)
        closeBtn.Size = UDim2.new(0,20,0,20)
        closeBtn.Position = UDim2.new(1,-25,0,5)
        closeBtn.Text = "X"
        closeBtn.TextSize = 14
        closeBtn.Font = Enum.Font.Legacy
        closeBtn.BackgroundColor3 = Color3.fromRGB(150,0,0)
        closeBtn.TextColor3 = colors.white
        closeBtn.MouseButton1Click:Connect(function()
            fileMenu:Destroy()
        end)

        -- Botón Clear Editor
        local clearBtn = Instance.new("TextButton", fileMenu)
        clearBtn.Size = UDim2.new(1,-10,0,30)
        clearBtn.Position = UDim2.new(0,5,0,30)
        clearBtn.Text = "Clear Editor"
        clearBtn.Font = Enum.Font.Legacy
        clearBtn.TextSize = 12
        clearBtn.BackgroundColor3 = colors.gray
        clearBtn.TextColor3 = colors.white
        clearBtn.MouseButton1Click:Connect(function()
            editorBox.Text = ""
            fileMenu:Destroy()
        end)

        -- Botón Toggle Line Numbers
        local toggleLinesBtn = Instance.new("TextButton", fileMenu)
        toggleLinesBtn.Size = UDim2.new(1,-10,0,30)
        toggleLinesBtn.Position = UDim2.new(0,5,0,65)
        toggleLinesBtn.Text = "Toggle Line Numbers"
        toggleLinesBtn.Font = Enum.Font.Legacy
        toggleLinesBtn.TextSize = 12
        toggleLinesBtn.BackgroundColor3 = colors.gray
        toggleLinesBtn.TextColor3 = colors.white
        toggleLinesBtn.MouseButton1Click:Connect(function()
            lineNums.Visible = not lineNums.Visible
        end)
    end)
end
