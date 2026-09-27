	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096054
sub_08096054: @ 0x08096054
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, _08096100 @ =0x02022CC8
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08096104 @ =0x0000125A
	bl DecodeMsg
	ldr r4, _08096108 @ =0x02012B68
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _0809610C @ =0x00001270
	bl DecodeMsg
	adds r4, #8
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, r6, #0
	adds r5, #0xa
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _080960C8
	movs r4, #4
_080960C8:
	bl GetConvoyItemCount_
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096100: .4byte 0x02022CC8
_08096104: .4byte 0x0000125A
_08096108: .4byte 0x02012B68
_0809610C: .4byte 0x00001270
