	.include "macro.inc"

	.syntax unified

	thumb_func_start DummvRSTMain
DummvRSTMain: @ 0x08055A50
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08055A8C @ =0x0201FDAC
	ldr r0, [r0]
	ldr r1, _08055A90 @ =0x0201FDB8
	cmp r0, #0
	bne _08055A60
	ldr r1, _08055A94 @ =0x0201FEF8
_08055A60:
	movs r2, #0
	ldr r5, [r3, #0x44]
	ldr r4, _08055A98 @ =0x03002870
_08055A66:
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08055A66
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bne _08055A86
	adds r0, r3, #0
	bl Proc_End
_08055A86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055A8C: .4byte 0x0201FDAC
_08055A90: .4byte 0x0201FDB8
_08055A94: .4byte 0x0201FEF8
_08055A98: .4byte 0x03002870
