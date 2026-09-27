	.include "macro.inc"

	.syntax unified

	thumb_func_start Event20
Event20: @ 0x0800BE74
	push {r4, r5, lr}
	sub sp, #8
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
	bne _0800BEA2
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BED0
_0800BEA2:
	add r3, sp, #4
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, _0800BECC @ =0x0202BBB8
	ldr r0, [sp]
	lsls r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	bl RenderMap
	movs r0, #0
	b _0800BEE4
	.align 2, 0
_0800BECC: .4byte 0x0202BBB8
_0800BED0:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoCenteredPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	movs r0, #2
_0800BEE4:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
