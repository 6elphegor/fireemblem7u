	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBgs
InitBgs: @ 0x08002A6C
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08002AB4 @ =0x080C59AC
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x18
	bl memcpy
	ldr r0, [r7]
	cmp r0, #0
	bne _08002A8E
	adds r0, r7, #4
	str r0, [r7]
_08002A8E:
	ldr r0, _08002AB8 @ =0x0300287C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002ABC @ =0x03002880
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002AC0 @ =0x03002884
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08002AC4 @ =0x03002888
	movs r1, #0
	strh r1, [r0]
	movs r0, #0
	str r0, [r7, #0x1c]
_08002AAA:
	ldr r0, [r7, #0x1c]
	cmp r0, #3
	ble _08002AC8
	b _08002B40
	.align 2, 0
_08002AB4: .4byte 0x080C59AC
_08002AB8: .4byte 0x0300287C
_08002ABC: .4byte 0x03002880
_08002AC0: .4byte 0x03002884
_08002AC4: .4byte 0x03002888
_08002AC8:
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl SetBgChrOffset
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl SetBgTilemapOffset
	ldr r0, [r7, #0x1c]
	ldr r2, [r7]
	ldrh r1, [r2]
	adds r2, #2
	str r2, [r7]
	bl SetBgScreenSize
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl GetBgTilemap
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	str r0, [r7, #0x20]
	adds r4, r7, #0
	adds r4, #0x20
	ldr r1, [r7, #0x1c]
	adds r0, r1, #0
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	ldr r2, _08002B3C @ =0x01000010
	adds r0, r4, #0
	bl CpuFastSet
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	b _08002AAA
	.align 2, 0
_08002B3C: .4byte 0x01000010
_08002B40:
	bl InitBmBgLayers
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #0
	bl InitOam
	ldr r0, _08002BE0 @ =0x02022860
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	bl EnablePalSync
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0]
	movs r2, #0xf8
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08002BE4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002BE0: .4byte 0x02022860
_08002BE4: .4byte 0x03002870
