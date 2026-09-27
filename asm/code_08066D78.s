	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrModifyBarfx
EkrModifyBarfx: @ 0x08066D78
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r3, #5
	ble _08066D86
	movs r0, #6
	b _08066D8E
_08066D86:
	ldr r0, _08066DA8 @ =0x082E5ACC
	lsls r1, r3, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_08066D8E:
	strh r0, [r2]
	adds r2, #2
	movs r1, #0
	movs r7, #0x10
	ldr r6, _08066DAC @ =0x082E5ADA
	subs r4, r3, #6
	movs r5, #7
_08066D9C:
	adds r0, r1, #0
	adds r0, #0xe
	cmp r3, r0
	blt _08066DB0
	strh r7, [r2]
	b _08066DC4
	.align 2, 0
_08066DA8: .4byte 0x082E5ACC
_08066DAC: .4byte 0x082E5ADA
_08066DB0:
	adds r0, r1, #6
	cmp r3, r0
	blt _08066DC2
	subs r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	b _08066DC4
_08066DC2:
	strh r5, [r2]
_08066DC4:
	adds r2, #2
	adds r1, #8
	cmp r1, #0x57
	ble _08066D9C
	cmp r3, #0x62
	ble _08066DD4
	movs r0, #0x17
	b _08066DEE
_08066DD4:
	cmp r3, #0x5d
	ble _08066DEC
	ldr r0, _08066DE8 @ =0x082E5AEC
	adds r1, r3, #0
	subs r1, #0x5e
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _08066DEE
	.align 2, 0
_08066DE8: .4byte 0x082E5AEC
_08066DEC:
	movs r0, #0x11
_08066DEE:
	strh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
