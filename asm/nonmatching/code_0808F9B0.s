	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPrepSpChar_OnInit
ProcPrepSpChar_OnInit: @ 0x0808F9B0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x34]
	bl ForceSyncUnitSpriteSheet
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0808F9F0
	ldr r0, _0808F9EC @ =0x084062AC
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	b _0808FA28
	.align 2, 0
_0808F9EC: .4byte 0x084062AC
_0808F9F0:
	ldr r0, _0808FA40 @ =0x084062AC
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	ldr r4, _0808FA44 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808FA1C
	movs r1, #1
_0808FA1C:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0808FA28:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r1, #7
	movs r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA40: .4byte 0x084062AC
_0808FA44: .4byte 0x0202BBF8
