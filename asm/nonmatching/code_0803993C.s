	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEscapePointStructThingMaybe
GetEscapePointStructThingMaybe: @ 0x0803993C
	push {r4, r5, r6, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, _0803995C @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r4, #0xff
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _08039974
	cmp r0, #0x40
	bgt _08039960
	cmp r0, #0
	beq _08039966
	b _0803997C
	.align 2, 0
_0803995C: .4byte 0x0202BBF8
_08039960:
	cmp r0, #0x80
	beq _0803996A
	b _0803997C
_08039966:
	movs r0, #0
	b _080399B6
_0803996A:
	ldr r1, _08039970 @ =0x08B97100
	b _08039976
	.align 2, 0
_08039970: .4byte 0x08B97100
_08039974:
	ldr r1, _080399BC @ =0x08B971C0
_08039976:
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
_0803997C:
	movs r0, #0
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080399B4
	ldr r0, _080399C0 @ =0x0202E3E4
	ldr r3, [r0]
	adds r2, r1, #0
_0803998E:
	ldrb r1, [r2, #1]
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrb r6, [r2]
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _080399AC
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _080399AC
	ldrb r4, [r1]
	adds r5, r2, #0
_080399AC:
	adds r2, #4
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0803998E
_080399B4:
	adds r0, r5, #0
_080399B6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080399BC: .4byte 0x08B971C0
_080399C0: .4byte 0x0202E3E4
