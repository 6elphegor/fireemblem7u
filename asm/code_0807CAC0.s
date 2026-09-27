	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CAC0
sub_0807CAC0: @ 0x0807CAC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _0807CB1C @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl ApplySystemObjectsGraphics
	ldr r1, _0807CB20 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807CB16
	movs r0, #0x90
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CB16
	ldr r0, _0807CB24 @ =0x08CA7994
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0x90
	bl ClearFlag
_0807CB16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB1C: .4byte 0x03002870
_0807CB20: .4byte 0x0202BBF8
_0807CB24: .4byte 0x08CA7994
