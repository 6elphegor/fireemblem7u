	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonScreenFlashing_RefrainPalette
EkrDragonScreenFlashing_RefrainPalette: @ 0x0806690C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08066938 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x3d
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066938: .4byte 0x03002870
