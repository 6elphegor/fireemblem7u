	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CA04
sub_0807CA04: @ 0x0807CA04
	push {r4, lr}
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r4, _0807CA38 @ =0x0202BBF8
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	bne _0807CA22
	ldr r2, _0807CA3C @ =0x00000FC9
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807CA22:
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0807CA32
	ldr r2, _0807CA40 @ =0x00000FCA
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807CA32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA38: .4byte 0x0202BBF8
_0807CA3C: .4byte 0x00000FC9
_0807CA40: .4byte 0x00000FCA
