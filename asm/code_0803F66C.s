	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F66C
sub_0803F66C: @ 0x0803F66C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F6B8
	movs r0, #2
	bl SioPlaySoundEffect
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r2, r5, #0
	adds r2, #0x48
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803F694
	subs r0, r1, #1
	strb r0, [r4]
_0803F694:
	ldrb r1, [r4]
	adds r0, r1, r5
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, r5, #0
	bl TacticianDrawCharacters
	b _0803F6BE
_0803F6B8:
	movs r0, #0
	bl SioPlaySoundEffect
_0803F6BE:
	pop {r4, r5}
	pop {r0}
	bx r0
