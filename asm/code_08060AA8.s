	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060AA8
sub_08060AA8: @ 0x08060AA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060AC4
	ldr r1, _08060AC0 @ =0x03002870
	ldrh r0, [r1, #0x20]
	adds r0, #2
	b _08060ACA
	.align 2, 0
_08060AC0: .4byte 0x03002870
_08060AC4:
	ldr r1, _08060AE8 @ =0x03002870
	ldrh r0, [r1, #0x20]
	subs r0, #2
_08060ACA:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08060AE2
	adds r0, r4, #0
	bl Proc_Break
_08060AE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060AE8: .4byte 0x03002870
