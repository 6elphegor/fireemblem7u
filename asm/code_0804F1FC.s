	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxFlashHPBar
NewEfxFlashHPBar: @ 0x0804F1FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804F230 @ =0x08B9AE9C
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne _0804F22A
	adds r0, r1, #0
	bl Proc_Break
_0804F22A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F230: .4byte 0x08B9AE9C
