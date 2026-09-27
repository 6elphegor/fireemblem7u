	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBaseAppearMain
EkrBaseAppearMain: @ 0x08051CDC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08051D04
	ldr r1, _08051D00 @ =0x0201FAC8
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08051D48
	.align 2, 0
_08051D00: .4byte 0x0201FAC8
_08051D04:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051D26
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08051D3C
_08051D26:
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08051D3C:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
_08051D48:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
