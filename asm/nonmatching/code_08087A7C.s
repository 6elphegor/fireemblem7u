	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_InitFadeOut
CgText_InitFadeOut: @ 0x08087A7C
	push {r4, lr}
	adds r4, r0, #0
	bl CgText_ClearSpriteText
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	bl EndCgTextInterpreter
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087AB0
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08087AB8
_08087AB0:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0x10
	strb r0, [r1]
_08087AB8:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08087AD0
	ldr r0, _08087AD8 @ =0x08B907C0
	bl Proc_Find
	bl StartFaceFadeOut
_08087AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087AD8: .4byte 0x08B907C0
