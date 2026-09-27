	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrPopup_DrawWRankUp2
ekrPopup_DrawWRankUp2: @ 0x0806B5CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x4c]
	cmp r2, #0
	beq _0806B5E8
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806B5E8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
