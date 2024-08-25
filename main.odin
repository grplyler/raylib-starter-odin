package main
import "core:fmt"
import rl "vendor:raylib"

// shorten println
println :: fmt.println


main :: proc () {
    rl.InitWindow(800, 450, "raylib odin starter project")
    rl.SetTargetFPS(60)
    rl.SetWindowState(rl.ConfigFlags{.WINDOW_RESIZABLE})
    
    // Load GUI Style
    rl.GuiLoadStyle("styles/cyber/style_cyber.rgs");

    // Pull out some colors
    BACKGROUND_COLOR := rl.GetColor(u32(rl.GuiGetStyle(rl.GuiControl.DEFAULT, rl.GuiControlProperty.BASE_COLOR_NORMAL)))
    TEXT_COLOR := rl.GetColor(u32(rl.GuiGetStyle(rl.GuiControl.DEFAULT, rl.GuiControlProperty.TEXT_COLOR_NORMAL)))

    // Cleanup layer
    defer rl.CloseWindow()

    // Main game loop
    for rl.WindowShouldClose() == false {

        if rl.IsKeyPressed(rl.KeyboardKey.Q) {
            break
        }

        rl.BeginDrawing()
        rl.ClearBackground(BACKGROUND_COLOR);
        rl.DrawText("Congrats! You're running raylib with Odin!", 190, 200, 20, TEXT_COLOR)

        // Add button
        if rl.GuiButton(rl.Rectangle{ 300, 300, 200, 50 }, "Press me!") {
            println("Button pressed!")
        }

        rl.EndDrawing()
    }
}