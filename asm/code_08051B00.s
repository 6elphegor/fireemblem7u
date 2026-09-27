	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrWindowAppearMain
EkrWindowAppearMain: @ 0x08051B00
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08051B2C
	ldr r1, _08051B28 @ =0x0201FAC0
	movs r0, #0
	str r0, [r1]
	bl EkrGauge_SetInitFlag
	adds r0, r4, #0
	bl Proc_Break
	b _08051B74
	.align 2, 0
_08051B28: .4byte 0x0201FAC0
_08051B2C:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051B4A
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b _08051B5C
_08051B4A:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
_08051B5C:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, _08051B7C @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC78
_08051B74:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051B7C: .4byte 0x02000038
