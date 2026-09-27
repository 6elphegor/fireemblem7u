	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F43C
sub_0808F43C: @ 0x0808F43C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F456
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _0808F494
_0808F456:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x38
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl StartTalkFace
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808F49C @ =0x00000FC6
	str r0, [sp]
	ldr r0, _0808F4A0 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808F4A4 @ =0x0002000A
	bl SetCgTextFlags
_0808F494:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F49C: .4byte 0x00000FC6
_0808F4A0: .4byte 0x06011800
_0808F4A4: .4byte 0x0002000A
