	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxClasschgRSTMain
EfxClasschgRSTMain: @ 0x08068AB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08068AF0
	ldr r1, _08068AF8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08068AF0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068AF8: .4byte 0x0201774C
