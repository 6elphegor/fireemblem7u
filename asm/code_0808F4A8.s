	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F4A8
sub_0808F4A8: @ 0x0808F4A8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	movs r5, #0
	ldr r1, [r2, #0x58]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0808F4C4
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _0808F514
_0808F4C4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F4CE
	ldr r5, _0808F51C @ =0x00000FC7
_0808F4CE:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0808F4D8
	ldr r5, _0808F520 @ =0x00000FC8
_0808F4D8:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x48
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4b
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl StartTalkFace
	movs r3, #1
	rsbs r3, r3, #0
	str r5, [sp]
	ldr r0, _0808F524 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808F528 @ =0x0002000A
	bl SetCgTextFlags
_0808F514:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F51C: .4byte 0x00000FC7
_0808F520: .4byte 0x00000FC8
_0808F524: .4byte 0x06011800
_0808F528: .4byte 0x0002000A
