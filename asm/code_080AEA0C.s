	.include "macro.inc"

	.syntax unified

	thumb_func_start ColFadeOut_Init
ColFadeOut_Init: @ 0x080AEA0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	adds r0, r3, r0
	cmp r3, r0
	bge _080AEA38
	ldr r2, _080AEA40 @ =0x020144F8
	ldr r1, _080AEA44 @ =0x02022860
	lsls r0, r3, #1
	adds r4, r0, r1
	adds r2, r0, r2
_080AEA24:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	adds r0, r0, r1
	cmp r3, r0
	blt _080AEA24
_080AEA38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AEA40: .4byte 0x020144F8
_080AEA44: .4byte 0x02022860
