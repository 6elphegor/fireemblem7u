	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C96C
sub_0807C96C: @ 0x0807C96C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807C984 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x11
	beq _0807C988
	cmp r0, #0x14
	beq _0807C996
	b _0807C9A2
	.align 2, 0
_0807C984: .4byte 0x0202BBF8
_0807C988:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C9AA
	b _0807C9A2
_0807C996:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C9AA
_0807C9A2:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0807C9AA:
	pop {r4}
	pop {r0}
	bx r0
