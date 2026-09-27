	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B724
sub_0806B724: @ 0x0806B724
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0806B744
	ldr r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806B744:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
