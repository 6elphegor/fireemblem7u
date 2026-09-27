	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBaStart_8055FE8
ekrBaStart_8055FE8: @ 0x08050DC4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050DF8
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08050DF8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
