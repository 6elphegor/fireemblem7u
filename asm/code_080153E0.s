	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMain_StartPhase
BmMain_StartPhase: @ 0x080153E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080153F8 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801541C
	cmp r0, #0x40
	bgt _080153FC
	cmp r0, #0
	beq _08015402
	b _08015424
	.align 2, 0
_080153F8: .4byte 0x0202BBF8
_080153FC:
	cmp r0, #0x80
	beq _0801540C
	b _08015424
_08015402:
	ldr r0, _08015408 @ =0x08B93374
	b _0801540E
	.align 2, 0
_08015408: .4byte 0x08B93374
_0801540C:
	ldr r0, _08015418 @ =0x08B96E80
_0801540E:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08015424
	.align 2, 0
_08015418: .4byte 0x08B96E80
_0801541C:
	ldr r0, _08015430 @ =0x08B96E80
	adds r1, r4, #0
	bl Proc_StartBlocking
_08015424:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015430: .4byte 0x08B96E80
