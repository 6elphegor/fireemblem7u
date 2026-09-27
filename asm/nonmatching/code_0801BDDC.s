	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugChargeMenu_Draw
DebugChargeMenu_Draw: @ 0x0801BDDC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801BE04 @ =0x081C3BB0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801BE0C
	ldr r0, _0801BE08 @ =0x0202BBF8
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801BE14
	.align 2, 0
_0801BE04: .4byte 0x081C3BB0
_0801BE08: .4byte 0x0202BBF8
_0801BE0C:
	ldr r0, _0801BE74 @ =0x0202BBF8
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801BE14:
	lsrs r6, r0, #0x1e
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0801BE78 @ =0x081C3BC0
	cmp r0, #0
	beq _0801BE32
	ldr r3, _0801BE7C @ =0x081C3BBC
_0801BE32:
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	lsls r0, r6, #2
	add r0, sp
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BE80 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE74: .4byte 0x0202BBF8
_0801BE78: .4byte 0x081C3BC0
_0801BE7C: .4byte 0x081C3BBC
_0801BE80: .4byte 0x02022C60
