	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803089C
sub_0803089C: @ 0x0803089C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _080308B8 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _080308BC
	adds r0, r4, #0
	bl Proc_End
	b _08030906
	.align 2, 0
_080308B8: .4byte 0x0202BBF8
_080308BC:
	bl sub_08018980
	movs r6, #0x10
	movs r0, #0x10
	ldrb r1, [r5, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080308DA
	bl SortPlayerUnitsForPrepScreen
	bl sub_0800F0C8
	ldrb r0, [r5, #0x14]
	orrs r0, r6
	strb r0, [r5, #0x14]
_080308DA:
	movs r0, #0
	bl GetCameraCenteredX
	ldr r4, _0803090C @ =0x0202BBB8
	strh r0, [r4, #0xc]
	movs r0, #0
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	orrs r0, r6
	strb r0, [r4, #4]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r5, #0xd]
	bl RefreshEntityMaps
	bl RenderMap
_08030906:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803090C: .4byte 0x0202BBB8
