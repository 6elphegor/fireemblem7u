	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043F50
sub_08043F50: @ 0x08043F50
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x54]
	ldr r4, _08043FA8 @ =0x08B999BC
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x50
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x60
	adds r3, r4, #0
	bl PutSprite
	adds r4, r5, #0
	adds r4, #0x68
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, #0x28
	movs r1, #0x60
	bl PutUiHand
	ldr r0, _08043FAC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08043FB0
	movs r0, #1
	bl SioPlaySoundEffect
	str r6, [r7, #0x50]
	b _08044012
	.align 2, 0
_08043FA8: .4byte 0x08B999BC
_08043FAC: .4byte 0x08B857F8
_08043FB0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08043FC8
	ldrh r0, [r4]
	cmp r0, #1
	bne _08043FC8
	subs r0, #1
	strh r0, [r4]
	movs r0, #3
	bl SioPlaySoundEffect
_08043FC8:
	ldr r0, _0804402C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043FEE
	adds r1, r5, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08043FEE
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_08043FEE:
	ldr r0, _0804402C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08044072
	adds r0, r5, #0
	adds r0, #0x68
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08044034
	movs r0, #1
	bl SioPlaySoundEffect
	movs r0, #2
	str r0, [r7, #0x50]
_08044012:
	ldr r0, _08044030 @ =0x020236A4
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b _08044072
	.align 2, 0
_0804402C: .4byte 0x08B857F8
_08044030: .4byte 0x020236A4
_08044034:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r0, _0804407C @ =0x02000C00
	ldr r1, [r7, #0x44]
	strb r1, [r0]
	movs r1, #4
	bl SioEmitData
	ldr r0, _08044080 @ =0x020236A4
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, _08044084 @ =0x06016800
	movs r1, #0xd
	bl LoadHelpBoxGfx
	ldr r2, _08044088 @ =0x00001192
	movs r0, #0x40
	movs r1, #0x48
	bl StartHelpBoxExt_Unk
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08044072:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804407C: .4byte 0x02000C00
_08044080: .4byte 0x020236A4
_08044084: .4byte 0x06016800
_08044088: .4byte 0x00001192
