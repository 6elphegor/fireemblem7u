	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F460
sub_0802F460: @ 0x0802F460
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802F48C @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _0802F476
	bl InitObstacleBattleUnit
_0802F476:
	ldrb r0, [r5, #0x12]
	cmp r0, #8
	bne _0802F490
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl BattleGenerateBallistaReal
	b _0802F49C
	.align 2, 0
_0802F48C: .4byte 0x0203A85C
_0802F490:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl BattleGenerateReal
_0802F49C:
	ldr r0, _0802F4AC @ =0x08B96360
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F4AC: .4byte 0x08B96360
