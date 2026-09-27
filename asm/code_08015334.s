	.include "macro.inc"

	.syntax unified

	thumb_func_start HandleChangePhase
HandleChangePhase: @ 0x08015334
	push {lr}
	ldr r2, _08015348 @ =0x0202BBF8
	ldrb r0, [r2, #0xf]
	cmp r0, #0x40
	beq _0801535E
	cmp r0, #0x40
	bgt _0801534C
	cmp r0, #0
	beq _08015352
	b _08015372
	.align 2, 0
_08015348: .4byte 0x0202BBF8
_0801534C:
	cmp r0, #0x80
	beq _08015358
	b _08015372
_08015352:
	movs r0, #0x80
	strb r0, [r2, #0xf]
	b _08015372
_08015358:
	movs r0, #0x40
	strb r0, [r2, #0xf]
	b _08015372
_0801535E:
	movs r0, #0
	strb r0, [r2, #0xf]
	ldrh r1, [r2, #0x10]
	ldr r0, _08015378 @ =0x000003E6
	cmp r1, r0
	bhi _0801536E
	adds r0, r1, #1
	strh r0, [r2, #0x10]
_0801536E:
	bl DoTurnSupportExp
_08015372:
	pop {r0}
	bx r0
	.align 2, 0
_08015378: .4byte 0x000003E6
