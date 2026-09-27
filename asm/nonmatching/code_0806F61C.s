	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackManimWindowGraphics
UnpackManimWindowGraphics: @ 0x0806F61C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x20
	bl UnpackManimWindowDigits
	ldr r1, _0806F648 @ =0x06000540
	ldr r0, [r7]
	bl Decompress
	ldr r1, _0806F64C @ =0x083FA12C
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F648: .4byte 0x06000540
_0806F64C: .4byte 0x083FA12C
