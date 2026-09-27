	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemPromoteAction
DoItemPromoteAction: @ 0x0802CC68
	push {r4, lr}
	ldr r4, _0802CC84 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	movs r2, #1
	bl sub_0802CBAC
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC84: .4byte 0x0203A85C
