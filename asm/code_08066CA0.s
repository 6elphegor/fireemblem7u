	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08066CA0
sub_08066CA0: @ 0x08066CA0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r0, #0
	mov ip, r0
	cmp r7, #0
	beq _08066D70
	movs r2, #0
_08066CB2:
	cmp r7, r2
	bgt _08066CC8
	mov r1, ip
	cmp r1, #0
	bne _08066CC4
	movs r0, #1
	mov ip, r0
	movs r0, #0xe
	b _08066D28
_08066CC4:
	movs r0, #0xff
	b _08066D28
_08066CC8:
	adds r0, r2, #1
	cmp r7, r0
	bne _08066CE4
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08066CDA
	movs r0, #0xd
	b _08066D28
_08066CDA:
	adds r1, r2, #4
	cmp r6, r0
	bne _08066D6A
	movs r0, #0xc
	b _08066D66
_08066CE4:
	adds r4, r2, #2
	cmp r7, r4
	bne _08066D08
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08066CF6
	movs r0, #0xb
	b _08066D28
_08066CF6:
	cmp r6, r0
	bne _08066CFE
	movs r0, #0xa
	b _08066D28
_08066CFE:
	adds r1, r2, #4
	cmp r6, r4
	bne _08066D6A
	movs r0, #9
	b _08066D66
_08066D08:
	adds r5, r2, #3
	cmp r7, r5
	bne _08066D3A
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08066D1A
	movs r0, #8
	b _08066D28
_08066D1A:
	cmp r6, r0
	bne _08066D22
	movs r0, #7
	b _08066D28
_08066D22:
	cmp r6, r4
	bne _08066D30
	movs r0, #6
_08066D28:
	strh r0, [r3]
	adds r3, #2
	adds r1, r2, #4
	b _08066D6A
_08066D30:
	adds r1, r2, #4
	cmp r6, r5
	bne _08066D6A
	movs r0, #5
	b _08066D66
_08066D3A:
	adds r1, r2, #4
	cmp r7, r1
	blt _08066D6A
	cmp r6, r2
	bgt _08066D48
	movs r0, #4
	b _08066D66
_08066D48:
	cmp r6, r0
	bne _08066D50
	movs r0, #3
	b _08066D66
_08066D50:
	cmp r6, r4
	bne _08066D58
	movs r0, #2
	b _08066D66
_08066D58:
	cmp r6, r5
	bne _08066D60
	movs r0, #1
	b _08066D66
_08066D60:
	cmp r6, r1
	blt _08066D6A
	movs r0, #0
_08066D66:
	strh r0, [r3]
	adds r3, #2
_08066D6A:
	adds r2, r1, #0
	cmp r2, #0x28
	ble _08066CB2
_08066D70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
