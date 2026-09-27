	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F034
sub_0808F034: @ 0x0808F034
	push {r4, lr}
	ldr r4, _0808F098 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0808F09C
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F09C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808F09C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F06C
	movs r1, #1
_0808F06C:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808F09C
	movs r0, #0x28
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0808F09C
	ldrb r1, [r0, #8]
	cmp r1, #0x14
	bne _0808F09C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _0808F09C
	movs r0, #0x90
	bl ClearFlag
	movs r0, #1
	b _0808F09E
	.align 2, 0
_0808F098: .4byte 0x0202BBF8
_0808F09C:
	movs r0, #0
_0808F09E:
	pop {r4}
	pop {r1}
	bx r1
