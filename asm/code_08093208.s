	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_InitGfx
PrepUnit_InitGfx: @ 0x08093208
	push {lr}
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #0xf
	bl PutPrepMenuUiImg
	ldr r0, _08093240 @ =0x02023460
	ldr r1, _08093244 @ =0x08406FD0
	movs r2, #0xf3
	lsls r2, r2, #8
	bl sub_080AACD8
	ldr r0, _08093248 @ =0x0840E0C0
	ldr r1, _0809324C @ =0x06010800
	bl Decompress
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08093240: .4byte 0x02023460
_08093244: .4byte 0x08406FD0
_08093248: .4byte 0x0840E0C0
_0809324C: .4byte 0x06010800
