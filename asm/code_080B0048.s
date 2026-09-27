	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassInfoDisplay_OnEnd
ClassInfoDisplay_OnEnd: @ 0x080B0048
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl EndActiveClassReelBgColorProc
	ldr r0, _080B0080 @ =0x0200DB40
	bl sub_080552DC
	bl EndActiveClassReelSpell
	ldr r0, _080B0084 @ =0x02000040
	bl sub_08054EF0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B0074
	bl Proc_End
_080B0074:
	movs r0, #2
	bl SetLordSelectState
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0080: .4byte 0x0200DB40
_080B0084: .4byte 0x02000040
