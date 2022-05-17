import React, { useEffect, useRef } from "react";
import "./App.css";

const BYTE_MAX_VALUE = 255;
const RED = 0;
const GREEN = 1;
const BLUE = 2;
const SIZE = (BYTE_MAX_VALUE + 1) * (BYTE_MAX_VALUE + 1);

function App() {
    const canvasRef = useRef<HTMLCanvasElement>(null);

    const showFile = (e: any) => {
        e.preventDefault();
        const reader = new FileReader();
        reader.onload = (e) => {
            const values = e.target?.result;
            const text = values?.toString();
            const lines = text?.split("\n");

            let start = RED * BYTE_MAX_VALUE;
            const red = lines
                ?.slice(start, start + BYTE_MAX_VALUE + 1)
                .map((item) => item.split(" "));
            start = GREEN * BYTE_MAX_VALUE;
            const green = lines
                ?.slice(start, start + BYTE_MAX_VALUE + 1)
                .map((item) => item.split(" "));
            start = BLUE * BYTE_MAX_VALUE;
            const blue = lines
                ?.slice(start, start + BYTE_MAX_VALUE + 1)
                .map((item) => item.split(" "));

            const pixels: Array<Array<{ r: number; g: number; b: number }>> =
                [];

            for (let i = 0; i < BYTE_MAX_VALUE + 1; i++) {
                const miniPixels: Array<{ r: number; g: number; b: number }> =
                    [];
                for (let j = 0; j < BYTE_MAX_VALUE + 1; j++)
                    miniPixels.push({
                        r: red ? parseInt(red[i][j]) : 0,
                        g: green ? parseInt(green[i][j]) : 0,
                        b: blue ? parseInt(blue[i][j]) : 0,
                    });
                pixels.push(miniPixels);
            }

            const canvas = canvasRef.current;
            const ctx = canvas?.getContext("2d");

            if (ctx != undefined) {
                pixels.forEach((miniPixels, x) =>
                    miniPixels.forEach((pixel, y) => {
                        const color: string = `rgb(${pixel.r},${pixel.g},${pixel.b})`;
                        ctx.fillStyle = color;
                        ctx.fillRect(x, y, 1, 1);
                    })
                );
            }
        };
        reader.readAsText(e.target.files[0]);
    };

    return (
        <div className="App">
            <header className="App-header">
                <input type="file" onChange={showFile} />

                <canvas
                    width={BYTE_MAX_VALUE + 1}
                    height={BYTE_MAX_VALUE + 1}
                    ref={canvasRef}
                />
            </header>
        </div>
    );
}

export default App;
