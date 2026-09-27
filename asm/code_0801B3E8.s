	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B3E8
sub_0801B3E8: @ 0x0801B3E8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl sub_080AAD7C
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0
	strb r0, [r6]
	bl GetCurrentBgmSong
	movs r1, #0
	cmp r1, r4
	bge _0801B41C
	cmp r0, #0
	bne _0801B40C
	strb r1, [r6]
	b _0801B41C
_0801B40C:
	adds r1, #1
	cmp r1, r4
	bge _0801B41C
	cmp r0, r1
	bne _0801B40C
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
_0801B41C:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0801B468 @ =0x08CE4D28
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B46C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B468: .4byte 0x08CE4D28
_0801B46C: .4byte 0x02022C60
