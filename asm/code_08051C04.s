	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrNamewinAppearMain
EkrNamewinAppearMain: @ 0x08051C04
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08051C38
	ldr r0, _08051C34 @ =0x0201FAC4
	movs r1, #0
	str r1, [r0]
	bl SyncEkrDispUP
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne _08051C2C
	bl EndEkrDispUP
_08051C2C:
	adds r0, r4, #0
	bl Proc_Break
	b _08051C76
	.align 2, 0
_08051C34: .4byte 0x0201FAC4
_08051C38:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051C58
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08051C6C
_08051C58:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08051C6C:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
_08051C76:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
