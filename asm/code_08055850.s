	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrTogiColor_Loop
ekrTogiColor_Loop: @ 0x08055850
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0805587C
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08055884 @ =0x02022920
	movs r2, #0x20
	bl CpuFastSet
	bl EnablePalSync
_0805587C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055884: .4byte 0x02022920
