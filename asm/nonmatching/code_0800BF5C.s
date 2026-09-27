	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_CameraPid
EvtCmd_CameraPid: @ 0x0800BF5C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BF86
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BFB8
_0800BF86:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl GetCameraAdjustedX
	ldr r4, _0800BFB4 @ =0x0202BBB8
	strh r0, [r4, #0xc]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl SetMapCursorPosition
	bl RenderMap
	b _0800BFD2
	.align 2, 0
_0800BFB4: .4byte 0x0202BBB8
_0800BFB8:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl SetMapCursorPosition
_0800BFD2:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
