	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_CameraPosition
EvtCmd_CameraPosition: @ 0x0800BEEC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BF18
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BF40
_0800BF18:
	adds r6, r4, #0
	lsls r0, r6, #4
	bl GetCameraAdjustedX
	ldr r4, _0800BF3C @ =0x0202BBB8
	strh r0, [r4, #0xc]
	lsls r0, r5, #4
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	bl RenderMap
	movs r0, #0
	b _0800BF54
	.align 2, 0
_0800BF3C: .4byte 0x0202BBB8
_0800BF40:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	movs r0, #2
_0800BF54:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
